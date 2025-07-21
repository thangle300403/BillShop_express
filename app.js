(async () => {
    const express = require('express');
    const ejsLayout = require('express-ejs-layouts');
    const path = require('path');
    const bodyParser = require('body-parser');
    const session = require('express-session');
    const FileStore = require('session-file-store')(session);
    const cookieParser = require('cookie-parser');
    const cors = require('cors');
    const { initVectorStore } = require("./controllers/api/Chatbot/vectorStore");
    const { debugListChromaContents } = require("./controllers/api/Chatbot/vectorStore");
    const { runInitialSeeds } = require("./controllers/api/Chatbot/runInitialSeed");
    // const { rebuildMemoryFromDB } = require("./controllers/api/Chatbot/rebuiltmemoryDB");

    // ✅ Initialize vector store before anything else
    await initVectorStore();
    await runInitialSeeds();
    // await rebuildMemoryFromDB();
    // await debugListChromaContents("consult_docs");
    // await debugListChromaContents("sql_docs");

    const app = express();
    const hostname = '127.0.0.1';
    const port = 3069;


    // Set the layout
    app.use(ejsLayout);
    app.use(
        cors({
            origin: ["http://localhost:3000", "http://127.0.0.1:3000", "http://localhost:3050", "http://127.0.0.1:3050"],
            credentials: true,
        })
    );

    const helpers = require('./utils/helpers');
    app.locals.helpers = helpers;
    app.use(cookieParser());

    app.set('views', './views');
    app.set('view engine', 'ejs');
    app.use(express.static(path.join(__dirname, 'public')));
    app.use(bodyParser.urlencoded({ extended: false }));
    app.use(bodyParser.json());
    app.use('/generated', express.static(path.join(process.cwd(), 'generated')));

    var fileStoreOptions = {};
    app.use(session({
        store: new FileStore(fileStoreOptions),
        secret: 'sinra tensei',
        resave: false,
        saveUninitialized: true,
    }));

    const indexRouter = require('./routers/IndexRouter');
    const adminRouter = require('./routers/AdminRouter');
    const apiRouter = require('./routers/ApiRouter');

    app.use((req, res, next) => {
        app.locals.currentRoute = helpers.getCurrentRoute(req.path);
        app.locals.uploadDir = __dirname + '/public/images';
        app.locals.session = req.session;
        next();
    });

    app.use('/', indexRouter);
    app.use('/admin', adminRouter);
    app.use('/api/v1', apiRouter);

    app.listen(port, hostname, () => {
        console.log(`✅ Server running at http://${hostname}:${port}`);
    });
})();
