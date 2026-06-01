# Zenle Cardano API

Base URL : `https://zenle-cardano-api.vercel.app`

---

## Endpoints

### POST `/wallet`
Génère un nouveau wallet Cardano.

**Body** : Aucun

**Réponse**
```json
{
  "privateKey": "ed25519_sk1...",
  "walletAddress": "addr1..."
}
```

---

### POST `/mint`
Mint un nouveau NFT sur la blockchain Cardano.

**Body (JSON)**

| Champ         | Type   | Requis | Description            |
|---------------|--------|--------|------------------------|
| `privateKey`  | string | ✅     | Clé privée du wallet   |
| `assetName`   | string | ✅     | Nom du NFT             |
| `description` | string | ✅     | Description du NFT     |

**Réponse**
```json
{
  "txHash": "abc123..."
}
```

---

### GET `/`
Vérifie que l'API est en ligne.