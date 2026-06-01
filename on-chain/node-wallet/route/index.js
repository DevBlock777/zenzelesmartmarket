import Router from "express"
import { generateWallet } from "../helpers/wallet_generator.js"
import {mintNft} from "../helpers/nft.js"
const router = Router()

/**
 * @route POST /wallet
 * @desc Generate a new wallet
 * @access Public
 */
router.post("/wallet", async (req, res) => {
    try{
const { privateKey, walletAddress } = await generateWallet()
    res.status(200).send({ privateKey, walletAddress })
    } catch(err){
        console.error("Error generating wallet:", err);
        res.status(500).send({ error: "Failed to generate wallet" })
    }
})

/**
 * @route POST /mint
 * @desc Mint a new NFT
 * @access Public
 */
router.post("/mint", async (req, res) => {
    try {
        const {privateKey, assetName, description} = req.body
        const txHash = await mintNft(privateKey, assetName, description)
        res.status(200).send({ txHash })
    } catch (err) {
        console.error("Error minting NFT:", err);
        res.status(500).send({ error: err })
    }
    
    })

export default router