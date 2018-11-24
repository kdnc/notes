## Threat modeling

#### Q - What is STRIDE?

- STRIDE is a model of threats, used to help reason and find threats to a system.
- It provides a mnemonic for security threats in six categories.
- It is used in conjunction with a model of the target system that can be constructed in parallel. This includes a full breakdown of processes, data stores, data flows and trust boundaries.

#### Q - What does STRIDE stands for?

- S for Spoofing of user identity
- T for Tampering
- R for Repudiation
- I for Information disclosure (privacy breach or data leak)
- D for Denial of service (D.o.S)
- E for Elevation of privilege

#### Q - What are the security property violated with each threat in STRIDE?

- Spoofing violates Authenticity
- Tampering violates Integrity
- Repudiation violates Non-repudiability
- Information disclosure violates Confidentiality
- Denial of Service violates Availability
- Elevation of Privilege violates Authorization

## Anti-forgery

#### Q - Explain how Cross-Site Request Forgery (CSRF or XSRF) attacks happen.
- In a cross-site request forgery (CSRF or XSRF), an attacker tricks the user into visiting a different web page (such as evil.com) with malignant code that secretly sends a malicious request to the application's web server (such as example-bank.com).
- Assume the user is logged into the application at example-bank.com. The user opens an email and clicks a link to evil.com, which opens in a new tab. The evil.com page immediately sends a malicious request to example-bank.com. Perhaps it's a request to transfer money from the user's account to the attacker's account. The browser automatically sends the example-bank.com cookies (including the authentication cookie) with this request. If the example-bank.com server lacks XSRF protection, it can't tell the difference between a legitimate request from the application and the forged request from evil.com.
- To prevent this, the application must ensure that a user request originates from the real application, not from a different site. The server and client must cooperate to thwart this attack.
- In a common anti-XSRF technique, the application server sends a randomly generated authentication token in a cookie. The client code reads the cookie and adds a custom request header with the token in all subsequent requests. The server compares the received cookie value to the request header value and rejects the request if the values are missing or don't match. This technique is effective because all browsers implement the same origin policy. Only code from the website on which cookies are set can read the cookies from that site and set custom headers on requests to that site. That means only your application can read this cookie token and set the custom header. The malicious code on evil.com can't.

