var express = require('express');
const {DiscordSDK} = require("@discord/embedded-app-sdk");
var router = express.Router();

/* GET users listing. */
router.get('/', async function (req, res, next) {

    console.log("hit");
    // Instantiate the SDK
    const discordSdk = new DiscordSDK("1309255291048558632");

    console.log(`SDK instantiated ${discordSdk.configuration.toString()}`);

    async function setupDiscordSdk() {
        console.log("Setting up Discord SDK");
        await discordSdk.ready()
            .catch(reportError => console.error(reportError));
    }

    await setupDiscordSdk().catch((err) => {
        console.log(err);
    });

    console.log(discordSdk.sourceOrigin);

    const {code} = await discordSdk.commands.authorize({
        client_id: "1309255291048558632",
        response_type: 'code',
        state: '',
        prompt: 'none',
        scope: [
            'applications.commands',
            'identify',

        ],
    });

    console.log(code);

    res.send(`auth success`);
});

module.exports = router;
