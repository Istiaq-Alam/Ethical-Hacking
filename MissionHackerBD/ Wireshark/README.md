## 🧠 **What is Wireshark?**

**Wireshark** is a powerful **network protocol analyzer**. It lets you see what’s happening on your network at a very detailed level by capturing and inspecting packets in real time.

---

## 🔧 **Step-by-Step: Install and Launch Wireshark on Kali Linux**

### ✅ Step 1: Check if Wireshark is installed

Kali Linux usually comes with Wireshark pre-installed. To check:

```bash
wireshark --version
```

If not installed, install with:

```bash
sudo apt update
sudo apt install wireshark -y
```

During install, if it asks:

> "Should non-superusers be able to capture packets?"
> Choose **Yes**.

---

### ✅ Step 2: Launch Wireshark

You can start it from:

* Terminal:

  ```bash
  sudo wireshark
  ```
* OR: Applications Menu → Wireshark

---

## 🌐 **Capture HTTP Login Packets: Your Assignment**

We will now simulate capturing an HTTP login (not HTTPS). Since modern websites use HTTPS, we’ll use a **demo HTTP login site** like:

🔗 [http://testphp.vulnweb.com/login.php](http://testphp.vulnweb.com/login.php)
(For educational use only.)

### 📌 Step-by-Step Packet Capture

#### 🟡 Step 1: Open Wireshark

* Run `sudo wireshark`
* Select your active network interface (usually `eth0`, `wlan0`, or similar)

#### 🟡 Step 2: Start Capturing

* Click on the **interface** (e.g., `wlan0`) to start capture.
* Apply this filter in the top box to capture only HTTP:

```bash
http
```

Now you’re only seeing HTTP packets.

#### 🟡 Step 3: Visit the Login Page

1. Open your browser and go to:

   ```
   http://testphp.vulnweb.com/login.php
   ```

2. Enter **any dummy credentials**, like:

   ```
   username: test
   password: test123
   ```

3. Submit the form.

---

### 🟢 Step 4: Stop Capturing

* Go back to Wireshark and click the **red square (Stop)** button.

---

## 🔍 **Analyze the Packet**

### ✅ Look for `POST` Request

1. Find a packet that says something like:

```
POST /login.php HTTP/1.1
```

2. Right-click that packet → Click **Follow** → **HTTP Stream**

3. You'll now see a conversation that includes:

```
username=test&password=test123
```

Boom! 🎯 You’ve captured credentials in plaintext. This is **why HTTP is insecure**—anyone on the same network can **sniff** passwords.

---

## 📁 Optional: Save the Capture File

* Go to `File → Save As`
* Save it as: `http_login_capture.pcapng`

---

## 📖 Summary

| Task          | Tool                    | Description                  |
| ------------- | ----------------------- | ---------------------------- |
| Install       | `apt install wireshark` | To install Wireshark         |
| Start capture | Wireshark GUI           | On your network interface    |
| Filter        | `http`                  | To only see HTTP traffic     |
| Capture       | Browser Login           | Using a test site            |
| Analyze       | Follow HTTP stream      | To view captured credentials |

---

## ⚠️ Important Notes

* **Only use test HTTP sites** — sniffing credentials on real users is **illegal and unethical**.
* HTTPS encrypts data, so you **cannot see passwords** in plain text.

---

Would you like me to generate a **PDF version of this guide** or help you with a sample **assignment write-up/report** for submission?
