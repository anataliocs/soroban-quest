## V0: ~~Soroban Quest~~ \-\> Stellar Quest 3

### Links

* https://github.com/anataliocs/soroban-quest

### Target Audience

Intermediate developers or Beginners (with hands-on support)

### Description

Guided developer experience in a pre-configured, user-friendly learning environment. Gain practical experience building
and deploying smart contracts.

**New Features:**

- Devcontainers are a relatively new OSS tech that let you spin up a customized dev environment on Codespaces or many  
  other platforms
- You can connect your local VS Code IDE to the Dev Env or access it in a browser
- Fully featured dev env with customized and blinged out terminal and IDE
- Integrated light desktop gives you access to a Firefox browser and GUI file mgmt system
- This gives you access to Wallet add-ons like xBull
- You can also create a Passkeys wallet with the OSS Free-Forever password mgmt app BitWarden
- Users are authenticated via Github and Discord via OAuth
- The DX will be a more guided, curated and gamified experience designed to be more engaging and fun

## Welcome

Welcome to a whole new updated \~\~Soroban Quest\~\~ Stellar Quest 3\!

It's a faster, more curated, guided developer journey through Stellar Smart Contracts.

Instead of being web app based, we directly use the dev tools that you will use during development during the learning
process.

- Quizzes are directly integrated into your IDE using VS Code hooks
- Learning tasks are implemented through a tree of modified TODOs
- Grading quizzes occurs via Github actions
- Code challenges involve learning through the normal workflow of:
- Making sure the tests run correctly
- Making sure you pass security gates in the build process for security, code quality and coding style

### Instructions

* ***For Facilitator or Organizer Role:***   
  *Before the event:*

    * *You are embarking on a journey of Smart contract mastery with Stellar Quest 3, an interactive learning game
      designed to ignite your understanding and empower you to build sophisticated smart contracts*

    * **Some of the tools you will use:**
        * Stellar CLI:  Build, deploy and invoke contracts on testnet
        * Stellar auth, storage, cross-contract calls and custom types
        * Stellar Asset Contract and standard token functionality
        * Decoding Stellar XDR and parsing transaction responses
        * You should be able to explain the above concepts and help participants with debugging
    * Run through all 3 quests successfully
    * Practice talking points on walking learners through the quests
    * Ensure every participant has:
        * An active Github account
        * Active Discord account connected to Stellar Dev Discord with attached Stellar testnet account

      *During the Event:*

* Gameplay Loop(Live Event) for the **FIRST** quest:
    * *ℹ️Note that Quest 1 vs Quest 2-6 have DIFFERENT Gameplay Loops*
        * Have everyone navigate to:  https://github.com/anataliocs/soroban-quest
        * Click on the “Open in Codespaces” link -> Click “Continue”
        * Have some content to go over during the loading process to keep the audience engaged (5-10min)
        * After everything loads -> Click “How-to-play” at the top of the README
            * Introduce the various tools:
                * Quest log
                * Journal
                * VNC embedded Firefox browser
            * Walk through steps to setup the quest
        * Next, Click “The First Quest” at the top of the README
            * Open the relevant `lib.rs` contract and explain each line of functionality to the audience
            * Walk through the steps to build the contract and explain what happens during the build process
            * Open the relevant `test.rs` and explain each line of the test
            * Walk through the steps to run the test suite
        * Next, have everyone navigate to the
          tutorial:  [https://developers.stellar.org/docs/build/smart-contracts/getting-started/deploy-to-testnet](https://developers.stellar.org/docs/build/smart-contracts/getting-started/deploy-to-testnet)

        * Walk through each step of the deploy tutorial explaining the details of how the Stellar CLI is being used
        * Explain how to deploy a contract using the Stellar CLI
        * Explain how to invoke a deployed contract using the Stellar CLI
        * Navigate back to the README in the Cloud VS Code IDE
            * Deploy the contract you built
            * Invoke the contract you built and be sure to pass in the parameter `--send` set to `yes`
                * e.g. `stellar contract invoke --send=yes`
        * Next, Click “Check your Answer” at the top of the README
            * Check your answer using `sq check` passing in the quest number e.g. `sq check 1`
            * Walk through the process to sign the XDR
            * Walk through the submission process to submit the “Signed XDR” using `sq submit –xdr`

            * ⭐Optional:  Here is your chance to shine\! You can teach the content listed here for each quest in
              whatever
              way you choose. Slides, live demo, etc.*
                * For help here, attend a DevRel Ambassador briefing session for watch a video of a previous session\!
