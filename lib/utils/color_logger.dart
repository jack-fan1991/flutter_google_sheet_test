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
    Level.FINE: AnsiColor.fg(40),
    Level.SEVERE: AnsiColor.fg(196),
  };

  static final Map<Level, int> methodCounts = {
    Level.SEVERE: 8,
  };

  static final levelEmojis = {
    Level.FINE: '💡 ',
    Level.SEVERE: '⛔ ',
  };

  static output(LogRecord record) {
    // methodCount = methodCounts[level];
    var color = levelColors[record.level] ?? AnsiColor.none();
    String emoji = levelEmojis[record.level] ?? "";
    var msg = color(
        '${record.level.name}: ${record.time}: ${record.loggerName}: ${record.message}');

    print("${emoji}${msg}");
  }
}
