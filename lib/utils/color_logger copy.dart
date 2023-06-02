import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

import 'dart:developer' as developer;

/// This class handles colorizing of terminal output.
class AnsiColor {
  /// ANSI Control Sequence Introducer, signals the terminal for new settings.
  static const ansiEsc = '\x1B[';

  /// Reset all colors and options for current SGRs to terminal defaults.
  static const ansiDefault = '${ansiEsc}0m';

  final int? fg;
  final int? bg;
  final bool color;

  AnsiColor.none()
      : fg = null,
        bg = null,
        color = false;

  AnsiColor.fg(this.fg)
      : bg = null,
        color = true;

  AnsiColor.bg(this.bg)
      : fg = null,
        color = true;

  @override
  String toString() {
    if (fg != null) {
      return '${ansiEsc}38;5;${fg}m';
    } else if (bg != null) {
      return '${ansiEsc}48;5;${bg}m';
    } else {
      return '';
    }
  }

  /// Resets all pen attributes in the terminal.
  String get up => "[0m";

  /// Write the [msg.toString()] with the pen's current settings and then
  /// reset all attributes.
  String write(Object msg) => '${this}$msg$up';

  String call(String msg) {
    if (color) {
      return '${this}$msg$ansiDefault';
    } else {
      return msg;
    }
  }

  AnsiColor toFg() => AnsiColor.fg(bg);

  AnsiColor toBg() => AnsiColor.bg(fg);

  /// Defaults the terminal's foreground color without altering the background.
  String get resetForeground => color ? '${ansiEsc}39m' : '';

  /// Defaults the terminal's background color without altering the foreground.
  String get resetBackground => color ? '${ansiEsc}49m' : '';

  static int grey(double level) => 232 + (level.clamp(0.0, 1.0) * 23).round();
}

class ColorLoggerFormatter {
  static const verticalLine = ' │ ';
  static final levelColors = {
    Level.FINE: AnsiColor.fg(12),
    Level.SEVERE: AnsiColor.fg(196),
  };

  static final Map<Level, int> methodCounts = {
    Level.FINE: 1,
    Level.SEVERE: 8,
  };

  static final levelEmojis = {
    Level.FINE: '💡 ',
    Level.SEVERE: '⛔ ',
  };

  static List<String> skipIfName = [
    "logger_helper",
    "package:bloc",
    "stream.dart",
    "zone.dart",
    "async_cast.dart",
    "stream_impl.dart",
    "dart:async",
    "flutter_bloc",
    "abstract_exception.dart",
    "base_bloc_widget.dart",
    "package:flutter/src/widgets/framework.dart",
    "package:flutter/src/scheduler/binding.dart",
    "dart:ui",
    "exception_helper.dart",
    "color_logger",
    "dart-sdk/lib",
    "logging"
  ];

  /// Matches a stacktrace line as generated on Android/iOS devices.
  /// For example:
  /// #1      Logger.log (package:logger/src/logger.dart:115:29)
  static final _deviceStackTraceRegex =
      RegExp(r'#[0-9]+[\s]+(.+) \(([^\s]+)\)');

  static String cleanTrackInfo(String stackInfo) {
    return stackInfo.replaceFirst(RegExp(r'^#\d+\s+'), '# ');
  }

  late DateTime _startTime;

  ColorLoggerFormatter();

  String getTime() {
    String _threeDigits(int n) {
      if (n >= 100) return '$n';
      if (n >= 10) return '0$n';
      return '00$n';
    }

    String _twoDigits(int n) {
      if (n >= 10) return '$n';
      return '0$n';
    }

    var now = DateTime.now();
    String formattedDate =
        "${now.year.toString()}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";
    var h = _twoDigits(now.hour);
    var min = _twoDigits(now.minute);
    var sec = _twoDigits(now.second);
    var ms = _threeDigits(now.millisecond);
    var timeSinceStart = now.difference(_startTime).toString();
    // return '$h:$min:$sec.$ms (+$timeSinceStart)';
    return '$formattedDate $h:$min:$sec.$ms';
  }

  void output(LogRecord record, {Function(String msg)? out}) {
    // methodCount = methodCounts[level];
    String? stackTraceStr =
        formatStackTrace(StackTrace.current, methodCounts[record.level] ?? 1);
    String timeStr = "";

    List<String> list = _formatAndPrint(
      record.level,
      record.message,
      timeStr,
      stackTraceStr,
    );
    final reversed =
        list.reversed.map((e) => cleanTrackInfo(e)).toList().forEach((msg) {
      if (out != null)
        out(msg);
      else {
        developer.log(msg);
      }
    });
    // for (String s in reversed) {
    //   // print(s);
    //   if (reversed.indexOf(s) == reversed.indexOf(reversed.last)) {
    //     final pre = reversed.indexOf(reversed.last) - 1;
    //     s += '  (${reversed[pre].split('(')[1]}';
    //     reversed.last = s;
    //   }
    // }
  }

  List<String> _formatAndPrint(
    Level level,
    String message,
    String time,
    String? stacktrace,
  ) {
    // This code is non trivial and a type annotation here helps understanding.
    // ignore: omit_local_variable_types
    List<String> buffer = [];
    List<String> lines = [];
    String lastPosition = "";
    var color = levelColors[level] ?? AnsiColor.none();
    for (var msgLine in message.split('\n')) {
      String emoji = levelEmojis[level] ?? "";
      buffer.add(color('$emoji$time$verticalLine $msgLine'));
    }
    // buffer.add(color(_topBorder));
    if (stacktrace != null) {
      lines = stacktrace.split('\n');
      String emoji = levelEmojis[level] ?? "";

      for (var line in lines) {
        buffer.add(line);
      }
    }

    // if (time != null) {
    //   buffer..add(color!('$verticalLine $time'));
    // }
    // add message
    // var emoji = _getEmoji(level);

    // if (level == LoggerLevel.tracking) {
    //   for (var msgLine in message.split('\n')) {
    //     // buffer.add(color!('$emoji$time$verticalLine $msgLine'));
    //     var emoji = _getEmoji(level);
    //     buffer.add('$color[$title]$verticalLine $emoji $msgLine');
    //   }
    // }

    // for (var msgLine in message.split('\n')) {
    //   // buffer.add(color!('$emoji$time$verticalLine $msgLine'));
    //   buffer.add('$emoji$time$verticalLine $msgLine');
    // }
    return buffer;
  }

  String? formatStackTrace(StackTrace stackTrace, int? methodCount) {
    var lines = stackTrace.toString().split('\n');
    var formatted = <String>[];
    var count = 0;
    for (var line in lines) {
      if (_discardDeviceStacktraceLine(line) ||
          skipFileIfNeed(line, skipIfName) ||
          line.contains("<asynchronous suspension>") ||
          line == "") {
        continue;
      }
      formatted.add('#$count   ${line.replaceFirst(RegExp(r'#\d+\s+'), '')}');
      count++;
      if (count >= methodCount!) {
        if (methodCount == 0) {
          formatted.clear();
        }
        break;
      }
    }

    if (formatted.isEmpty) {
      return null;
    } else {
      return formatted.join('\n');
    }
  }

  bool _discardDeviceStacktraceLine(String line) {
    var match = _deviceStackTraceRegex.matchAsPrefix(line);
    if (match == null) {
      return false;
    }
    return match.group(2)!.startsWith('package:logger');
  }

  bool skipFileIfNeed(String line, List<String> skipFiles) {
    for (final skipFile in skipFiles) {
      if (line.contains(skipFile)) {
        return true;
      }
    }
    var match = _deviceStackTraceRegex.matchAsPrefix(line);
    if (match == null) {
      return false;
    }
    return false;
  }
}
