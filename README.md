## 🧘‍♂️ ZenGreetings Smart Contract

A simple, interactive smart contract built for fun and experimentation.
Set a greeting, track name changes, store custom messages, and collect likes all on-chain!

[![Watch the video](https://img.youtube.com/vi/gBu6_DZUn8I/maxresdefault.jpg)](https://youtu.be/gBu6_DZUn8I)

### [Watch on YouTube](https://youtu.be/gBu6_DZUn8I)

---

### ✨ Features

* **Owner-controlled name**: Only the owner can change the global `name`.
* **Name change tracker**: Tracks how often and when the name was last changed.
* **Name history**: View the full list of all names ever set.
* **Custom greetings**: Users can store and retrieve their own greeting message.
* **Like system**: Anyone can like or unlike the greeting once with total likes tracked.

---

### 🔧 Functions

#### 👑 Owner-only

* `changeName(string newName)`: Change the global name.
* `owner`: View the owner address.

#### 🧾 Public Read

* `greet()`: Returns default greeting like `"Hello, Zen!"`
* `getMyGreeting()`: Returns your custom greeting if set, else falls back to `greet()`.
* `nameChangeComment()`: Get a fun comment based on how many times the name changed.
* `getLastChangeDate()`: Returns the Unix timestamp of the last name change.
* `getNameHistoryLength()`: Get how many names are stored.
* `getNameAtIndex(uint256 index)`: Get a name from the name history.

#### ✍️ Public Write

* `setCustomGreeting(string message)`: Set your personal greeting.
* `likeGreeting()`: Like the greeting once per address.
* `unlikeGreeting()`: Undo your like.

#### 💚 Likes

* `totalLikes`: How many likes the greeting has.
* `hasLiked(address)`: Check if a specific address has liked it.

---

### 📦 Example

```solidity
await contract.setCustomGreeting("Wagmi! 🙌");
await contract.getMyGreeting(); // "Wagmi! 🙌, Zen!"

await contract.likeGreeting();
await contract.totalLikes(); // 1
```

---

### 🔐 Access Control

* Only the deployer (contract `owner`) can change the global name.

---

### 🚀 Ideas for Expansion

* Emoji reactions instead of just likes
* NFT badge for top likers
* Timelocked name changes
* Greeting of the week leaderboard
* Store a mood or status with greetings

---

### 🔗 Official ZenChain Links

- [Twitter](https://twitter.com/zen_chain)
- [Telegram Announcements](https://t.me/ZenchainAnnouncements)
- [Telegram Chat](https://t.me/Zenchainofficialchat)
- [Technical Documentation](https://docs.zenchain.io)
- [ZenQuest](https://zenquest.zenchain.io/quests)
- [Faucet](https://faucet.zenchain.io)
- [Node Station](https://node.zenchain.io)
- [Explorer](https://zentrace.io)
- [Litepaper](https://github.com/zenchain-protocol/litepaper)
- [Discord](https://discord.gg/zenchain)
- [Add ZenChain Testnet](https://chainlist.org/?search=zenchain)

---

## 📚 Contributing

Pull requests are welcome.

---

### 📄 License

MIT — free to use, remix, and enjoy.
