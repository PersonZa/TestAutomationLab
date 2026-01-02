# Lab 4: Test Automation (Robot Framework)

โปรเจกต์นี้เป็นการทำ Automated Testing สำหรับระบบ **Workshop Registration** โดยใช้ **Robot Framework** ร่วมกับ **SeleniumLibrary** ตามโจทย์ Lab 4 รายวิชา Software Engineering

## สิ่งที่ต้องเตรียม (Prerequisites)
*   **Python** (Version 3.7 ขึ้นไป)
*   **Robot Framework**
*   **SeleniumLibrary**
*   **Google Chrome** และ Web Server จำลอง

## วิธีการรันการทดสอบ (How to run)

เนื่องจากหน้าเว็บทดสอบ (`Registration.html`) ไม่ได้อยู่บน Server จริง จึงต้องจำลองเครื่องเป็น Web Server ก่อนการทดสอบ

### ขั้นตอนที่ 1: เปิด Web Server
1. เปิด Command Prompt หรือ Terminal
2. เข้าไปที่โฟลเดอร์ที่เก็บไฟล์ `Registration.html` (`.../StarterFiles`)
3. รันคำสั่งต่อไปนี้เพื่อจำลอง Server ที่ Port 7272:
   ```bash
   python -m http.server 7272
   ```
   *(ห้ามปิดหน้าต่างนี้ระหว่างการทดสอบ)*

### ขั้นตอนที่ 2: รันชุดทดสอบ Robot Framework
1. เปิด Command Prompt หน้าต่างใหม่
2. รันคำสั่งทดสอบ:
   ```bash
   robot tests/registration.robot
   ```



## รายการทดสอบ (Test Scenarios)

ชุดการทดสอบนี้ครอบคลุม UAT ทั้งหมด 8 กรณี ตามที่ระบุใน Lab Sheet:

1.  **Register Success**: ลงทะเบียนสำเร็จ (กรอกครบทุกช่อง)
2.  **Register Success (No Org)**: ลงทะเบียนสำเร็จ (เว้นช่อง Organization ที่เป็น Optional)
3.  **Empty First Name**: ทดสอบไม่กรอกชื่อจริง (ระบบต้องแจ้งเตือน)
4.  **Empty Last Name**: ทดสอบไม่กรอกนามสกุล
5.  **Empty First Name & Last Name**: ทดสอบไม่กรอกทั้งชื่อและนามสกุล
6.  **Empty Email**: ทดสอบไม่กรอกอีเมล
7.  **Empty Phone Number**: ทดสอบไม่กรอกเบอร์โทรศัพท์
8.  **Invalid Phone Number**: ทดสอบกรอกเบอร์ผิดรูปแบบ



## รายงานข้อผิดพลาด (Defect Report)

จากการทดสอบ พบข้อผิดพลาด (Defect) 1 รายการ:

*   **Scenario**: UAT-Lab04-002 Invalid Phone Number
*   **Issue**: ข้อความแจ้งเตือน Error Message ที่แสดงจริงบนหน้าเว็บ **ไม่ตรงกับ** ข้อความที่ระบุไว้ใน Expected Result ของใบงาน
    *   *Expected*: `Please enter a valid phone number, e.g., 081-234-5678...`
    *   *Actual*: `Please enter a valid phone number!!`
*   **Result**: สถานะการทดสอบข้อนี้เป็น **FAIL**



## การปรับแต่งเพิ่มเติมใน Code
*   มีการเพิ่มคำสั่ง `Set Selenium Speed 0.5s` ในไฟล์ `registration.robot` เพื่อหน่วงเวลาการทำงานให้ช้าลงเล็กน้อย ช่วยให้สามารถสังเกตการกรอกข้อมูลและแคปหน้าจอ (Screen Capture) ได้ทัน



**หมายเหตุ**: ผลงานชิ้นนี้ได้รับการจัดทำและพัฒนาโค้ดด้วยความช่วยเหลือจาก **AI Assistant** เพื่อการเรียนรู้และทำความเข้าใจกระบวนการ Automate Test อย่างเป็นขั้นตอน
