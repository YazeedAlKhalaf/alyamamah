import jwt from "jsonwebtoken";

class Utils {
  static generateJwtToken(username: string): string {
    const privateKey: string = Buffer.from(
      process.env.JWT_PRIVATE_KEY as string,
      "base64"
    ).toString();

    const payload = { username };

    const token: string = jwt.sign(payload, privateKey, {
      algorithm: "RS256",
      audience: "alyamamah",
      issuer: "https://yu.alkhalaf.dev",
      // - makes sure the token is not used before at least 3 seconds.
      notBefore: 3,
      expiresIn: 3 * 60 * 60, // 3 hours
    });

    return token;
  }

  static getJwtPayload(token: string): string | jwt.JwtPayload {
    const publicKey: string = Buffer.from(
      process.env.JWT_PUBLIC_KEY as string,
      "base64"
    ).toString();

    return jwt.verify(token, publicKey, {
      algorithms: ["RS256"],
      audience: "alyamamah",
      issuer: "https://yu.alkhalaf.dev",
      ignoreExpiration: false,
      ignoreNotBefore: false,
    });
  }

  static isJwtTokenValid(token: string): boolean {
    try {
      const decodedToken: string | jwt.JwtPayload = this.getJwtPayload(token);

      return decodedToken != null;
    } catch (error: any) {
      console.error(`Utils | isJwtTokenValid() | ${error}`);

      return false;
    }
  }

  static getUsernameFromJwt(token: string): string | null {
    const decodedToken = this.getJwtPayload(token);

    if (typeof decodedToken === "object" && "username" in decodedToken) {
      return decodedToken.username;
    }

    return null;
  }

  static postgresConnectionUri(
    user: string,
    password: string,
    host: string,
    port: string,
    dbName: string
  ): string {
    return `postgres://${user}:${password}@${host}:${port}/${dbName}`;
  }
}

export default Utils;
