const functions = require('firebase-functions');
const nodemailer = require('nodemailer');

// 创建 HTTP 函数
module.exports.sendMail = functions.https.onRequest(async (req, res) => {
  if (req.method !== 'POST') {
    res.status(405).send('Http Method Not Allowed (expecting POST)');
    return;
  }
  try {
    const body = JSON.parse(req.body) ;
    const recipient =body['recipient'];
    const subject =body['subject'];
    const text =body['text'];

    const transporter = nodemailer.createTransport({
      service: 'Gmail',
      auth: {
        user: 'owl.qa.test@gmail.com',
        /// 安全設定
        /// 需啟用兩步驟驗證
        /// https://myaccount.google.com/security
        /// 這定應用程序密碼
        /// https://myaccount.google.com/apppasswords
        pass: 'ycnwgqadkagpspby',
      },
    });
  
    const mailOptions = {
      from: 'owl.qa.test@gmail.com',      
      to: `${recipient}`.split(','),
      subject: `${subject}`,
      text: `${text}`
    };


    const info = await transporter.sendMail(mailOptions);
    console.log('Email sent:', info.response);

    res.status(200).json({
      message: "Email sent successfully",
      recipient: `${recipient}`,
      subject: `${subject}`,
      text: `${text}`
    })
  } catch (error) {
    //   console.error('Error sending email:', error);
    // res.status(500).send('Error sending email');
    const stack = `${error.stack}`.split('\n');
    res.status(500).json({message:`Error sending email`,error: `${error}`,stack:`Line : ${stack[1]}`});
  }
}
);
