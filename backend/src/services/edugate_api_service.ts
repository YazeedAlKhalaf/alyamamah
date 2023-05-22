import axios, { HttpStatusCode } from "axios";
import * as https from "https";

class EdugateApiService {
  private apiBase: string;

  constructor(apiBase: string) {
    this.apiBase = apiBase;
  }

  public async checkUserCredentials(
    username: string,
    password: string
  ): Promise<boolean> {
    const encodedCredentials = Buffer.from(`${username}:${password}`).toString(
      "base64"
    );
    const response = await axios.get(
      `${this.apiBase}/resources/common/commonServies/actorDetails/-1/1/2`,
      {
        headers: {
          Authorization: `Basic ${encodedCredentials}`,
        },
        httpsAgent: agent,
      }
    );

    return (
      response.status == HttpStatusCode.Ok &&
      response.data.commonInfo.status == true
    );
  }
}

export default EdugateApiService;

const agent = new https.Agent({
  rejectUnauthorized: false,
});
