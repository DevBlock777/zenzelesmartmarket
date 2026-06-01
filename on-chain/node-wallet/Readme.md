# Zenle Cardano API

Base URL : `https://zenle-cardano-api.vercel.app`

---

## Endpoints

### POST `/wallet`
Génère un nouveau wallet Cardano.

**Body** : Aucun

**Retourne un objet avec les champs**
```js
{
  "privateKey",
  "walletAddress"
}
```

---

### POST `/mint`
Mint un nouveau NFT sur la blockchain Cardano.

**Body (JSON) à fournir lors de la requête**

| Champ         | Type   | Requis | Description            |
|---------------|--------|--------|------------------------|
| `privateKey`  | string | ✅     | Clé privée du wallet   |
| `assetName`   | string | ✅     | Nom du NFT             |
| `description` | string | ✅     | Description du NFT     |

**Retourne le hash de la transaction ou txHash**
```js
{
  "txHash"
}
```

---

### GET `/`
Vérifie que l'API est en ligne.