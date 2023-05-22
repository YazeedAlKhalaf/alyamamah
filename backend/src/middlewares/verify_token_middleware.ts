import { Request, Response, NextFunction } from "express";
import Utils from "../core/utils";

function verifyToken(req: Request, res: Response, next: NextFunction): void {
  let token = req.header("Authorization");
  if (!token) {
    res.status(401).end();
    return;
  } else if (token.startsWith("Bearer ")) {
    // remove the 'Bearer ' part.
    token = token.slice(7, token.length);
  } else {
    res.status(401).end();
    return;
  }

  const isTokenValid = Utils.isJwtTokenValid(token);
  if (!isTokenValid) {
    res.status(401).end();
    return;
  }

  req.body.token = token;
  next();
}

export { verifyToken };
