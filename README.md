# owlmarket_qa_connect

# 1. Test google sheet 
# 2. Test firebase emulator and functions

## Node.js gmail
* 使用的gmail帳號需要開啟兩步驟驗證
* 開啟後會產生一組應用程式密碼，請將此密碼填入`backend/functions/src/mailer.js`中的`password`
* backend/functions/src/mailer.js
### URL
* POST http://127.0.0.1:5001/owlmarket-qa-connect/us-central1/mailer

* 請求主體 (Request Body)
```json
{
  "recipient": ["recipient1@example.com", "recipient2@example.com"],
  "subject": "Test Email",
  "text": "This is a test email."
}
```
* 回應 (Response)
    * 成功回應 (Status 200)
        * Email sent successfully
    * 錯誤回應 (Status 500)
        * 內容：JSON 物件
            ```json
            {
            "message": "Error sending email",
            "error": "錯誤訊息",
            "stack": "錯誤堆疊"
            }
            ```
