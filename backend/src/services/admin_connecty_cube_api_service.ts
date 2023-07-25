import axios, { HttpStatusCode } from "axios";
import qs from "qs";

class AdminConnectyCubeApiService {
  private apiBase: string;

  constructor(apiBase: string) {
    this.apiBase = apiBase;
  }

  public async getIdByUsername(username: string): Promise<string> {
    const response = await axios.get(
      `${this.apiBase}/apps/7222/service/users?search=custom_${username}&limit=1&offset=0`,
      {
        headers: {
          Cookie: `token=${process.env.CONNECTY_CUBE_ADMIN_API_TOKEN}`,
          "X-Requested-With": "XMLHttpRequest",
        },
      }
    );

    return response.data.items[0].user.id;
  }

  public async getDialogIdByName(dialogName: string): Promise<string | null> {
    const response = await axios.get(
      `${this.apiBase}/apps/7222/service/chat/dialogs?search=${dialogName}&limit=1&offset=0`,
      {
        headers: {
          Cookie: `token=${process.env.CONNECTY_CUBE_ADMIN_API_TOKEN}`,
          "X-Requested-With": "XMLHttpRequest",
        },
      }
    );

    if (response.data.items.length == 0) {
      console.log(
        "getDialogIdByName | no group dialog found by dialog name",
        dialogName
      );
      return null;
    }

    return response.data.items[0]._id;
  }

  public async updateGroupDialog(
    dialogId: string,
    occupantsIds: string[]
  ): Promise<boolean> {
    let data = qs.stringify({
      "chat_dialog[occupants_ids]": occupantsIds.join(","),
    });

    const response = await axios.request({
      method: "put",
      maxBodyLength: Infinity,
      url: `${this.apiBase}/apps/7222/service/chat/dialogs/${dialogId}/edit`,
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        Cookie: `token=${process.env.CONNECTY_CUBE_ADMIN_API_TOKEN}`,
        "X-Requested-With": "XMLHttpRequest",
      },
      data: data,
    });

    return response.status == HttpStatusCode.Ok;
  }

  public async createGroupDialog(
    name: string,
    occupantsIds: string[]
  ): Promise<boolean> {
    let data = qs.stringify({
      "chat_dialog[name]": name,
      "chat_dialog[description]": "",
      "chat_dialog[photo]": "",
      "chat_dialog[type]": "2",
      "chat_dialog[occupants_ids]": occupantsIds.join(","),
      "chat_dialog[admins_ids]": "",
    });

    const response = await axios.request({
      method: "post",
      maxBodyLength: Infinity,
      url: `${this.apiBase}/apps/7222/service/chat/dialogs`,
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        Cookie: `token=${process.env.CONNECTY_CUBE_ADMIN_API_TOKEN}`,
        "X-Requested-With": "XMLHttpRequest",
      },
      data: data,
    });

    return response.status == HttpStatusCode.Created;
  }
}

export default AdminConnectyCubeApiService;
