const { Contract, Instance } = require("@solana/web3.js");

class Crowdfund extends Contract {
  constructor(programId) {
    super(programId);
  }

  async create(
    initiator,
    goalAmount,
    deadline
  ) {
    const data = new Uint8Array(
      // encode the goal amount
      new Float64Array([goalAmount]).buffer,
      // encode the deadline
      new Float64Array([deadline]).buffer
    );
    const instance = await Instance.forProgram(this.connection, this.programId, [initiator], data);
    return new CrowdfundInstance(this.connection, instance);
  }
}

class CrowdfundInstance extends Instance {
  async contribute(contributor, amount) {
    const data = new Uint8Array(new Float64Array([amount]).buffer);
    await this.invoke("Contribute", [contributor], data);
  }

  async getGoalAmount() {
    const result = await this.invoke("GetGoalAmount", []);
    return new Float64Array(result.data.buffer)[0];
  }

  async getDeadline() {
    const result = await this.invoke("GetDeadline", []);
    return new Float64Array(result.data.buffer)[0];
  }

  async getTotalAmount() {
    const result = await this.invoke("GetTotalAmount", []);
    return new Float64Array(result.data.buffer)[0];
  }
}
