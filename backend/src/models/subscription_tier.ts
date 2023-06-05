enum SubscriptionTier {
  alyamamahGPT = "alyamamahGPT",
}

const stringToSubscriptionTier = (str: string): SubscriptionTier | null => {
  switch (str) {
    case "dev.alkhalaf.alyamamah.alyamamahGPT":
      return SubscriptionTier.alyamamahGPT;
    default:
      return null;
  }
};

export default SubscriptionTier;
export { stringToSubscriptionTier };
