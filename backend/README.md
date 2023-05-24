# backend

To install dependencies:

```bash
npm i
```

To run locally:

```bash
npm run dev
```

## Generate JWT_PRIVATE_KEY & JWT_PUBLIC_KEY envrionment variables

To create a private key:

```
openssl genpkey -algorithm RSA -out private.pem -pkeyopt rsa_keygen_bits:4096
```

To encode the private key to base64, at least on macOS:

```
base64 -i private.pem -o private.base64
```

To get the public key from the private key:

```
openssl rsa -pubout -in private.pem -out public_key.pem
```

To encode the public key to base64, at least on macOS:

```
base64 -i public_key.pem -o public_key.base64
```
