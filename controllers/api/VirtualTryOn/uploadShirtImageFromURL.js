import axios from "axios";
import fs from "fs";
import path from "path";
import { v4 as uuidv4 } from "uuid";
import { uploadImageToGemini as uploadToGemini } from "./uploadGeminiHelper.js";

/**
 * Downloads an image from a public URL, stores it temporarily,
 * then uploads to Gemini via /upload endpoint.
 */
export async function uploadShirtImageFromURL(imageUrl) {
    try {
        const tempFilename = `shirt-temp-${uuidv4()}.png`;
        const tempPath = path.join(process.env.UPLOAD_DIR || "uploads", tempFilename);

        // 1. Download image
        const response = await axios.get(imageUrl, { responseType: "arraybuffer" });
        fs.writeFileSync(tempPath, response.data);

        // 2. Upload to Gemini
        const geminiUploadResponse = await uploadToGemini(tempPath);

        return {
            geminiFile: geminiUploadResponse,
            path: tempPath,
        };
    } catch (err) {
        console.error("❌ Failed to upload shirt image:", err.message);
        throw new Error("Không thể tải ảnh sản phẩm lên Gemini.");
    }
}
