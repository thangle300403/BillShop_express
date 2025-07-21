const chatbotModel = require('../../models/Chatbot');
const jwt = require('jsonwebtoken');

const ApiChatbotController = {
    chatHistory: async (req, res) => {
        try {
            const token = req.cookies.access_token;
            // const authHeader = req.headers.authorization;
            // const token = authHeader?.split(' ')[1];
            // const token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTA0LCJlbWFpbCI6InRoYW5nbGUzMDA0MDNAZ21haWwuY29tIiwibmFtZSI6IlRo4bqvbmcgTMOqIiwiaWF0IjoxNzUyNTQ2MTQzLCJleHAiOjE3NTUxMzgxNDN9.T926_dPF2_jF20s5ix-PIaUYYjSABiaAdMYV3iNNYHY";
            if (!token) {
                return res.status(401).json({ message: 'No token provided' });
            }

            const decoded = jwt.verify(token, process.env.JWT_KEY);
            const email = decoded.email;

            const chatHistory = await chatbotModel.findByEmail(email);

            res.json(chatHistory);
        } catch (error) {
            console.error('History error:', error.message);
            res.status(500).send(error.message);
        }
    },
};

module.exports = ApiChatbotController;
