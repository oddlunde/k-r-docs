# Kör Documentation

## Overview

### Intro

- :computer: [How to get started](#how-to-get-started)
- :key: [Add ENV](#add-env)
- :rocket: [How to build and distribute](#how-to-build-and-distribute)
- :airplane: [How to use CodePush](#how-to-use-code-push)
- :hammer: [Tech stack](#tech-stack)
- :memo: [Git workflow](#git-workflow)
- :hankey: [Style guide](#style-guide)

### Core modules

- :door: [Session](docs/core-modules/session.md)
- :file_folder: [Creating a new profile](docs/core-modules/new-profile.md)
- :school: [Booking a lesson](docs/core-modules/lesson-booking.md)
- :office: [Booking a program](docs/core-modules/program-booking.md)
- :red_car: [Private practice](docs/core-modules/private-practice.md)

### 3rd-party services

- :bell: [Push notifications](docs/3rd-party-services/push-notifications.md)
- :earth_africa: [Maps](docs/3rd-party-services/maps.md)
- :bar_chart: [Analytics](docs/3rd-party-services/analytics.md)
- :credit_card: [Payments](docs/3rd-party-services/payments.md)
- :chart_with_upwards_trend: [Attribution](docs/3rd-party-services/attribution.md)
- :rotating_light: [Reporting service](docs/3rd-party-services/reporting-service.md)

---

### How to get started[⬆](#overview)

- **Step -1:** Run script in [development environment - general setup](development-general-setup-mac.md)
- **Step 0:** Make sure you've finished the [development environment setup](https://reactnative.dev/docs/environment-setup) for react native cli project
- **Step 1:** Clone the repo
- **Step 2:** Make sure the [Node.js v12+](https://nodejs.org/en/) and [Yarn](https://yarnpkg.com/) are installed
- **Step 3:** Make `cd` to the cloned repo
- **Step 4:** :closed_lock_with_key: [Add environment variables and secrets](#add-env)
- **Step 5:** Install dependencies with `yarn` command
- **Step 6:** Install pods with `yarn pods` command
- **Step 7:** Run either `yarn ios-dev` or `yarn android-dev`

---

### Add ENV[⬆](#overview)

Each platform has its own environment files.

1. Add `.env.development`, `.env.staging`, and `.env.production` files for each platform in `config/env` folder.

2. Create `secrets.xml` file in the `android/app/src/main/res/values` directory with given content:

```xml
<?xml version="1.0" encoding="utf-8"?>
<resources>
  <string name="rnbg_license">INSERT_REACT_NATIVE_BACKGROUND_GEOLOCATION_LICENSE_HERE</string>
  <string name="codepush_deployment_key">INSERT_YOUR_KEY</string>
  <string name="codepush_public_key">-----BEGIN PUBLIC KEY-----
YOUR_KEY
-----END PUBLIC KEY-----</string>
  <string name="fb_app_id">INSERT_FACEBOOK_APP_ID</string>
  <string name="branch_test_mode">INSERT_YOUR_VALUE</string>
  <string name="branch_key">INSERT_BRANCH_KEY</string>
  <string name="gm_api_key">INSERT_GOOGLE_MAPS_API_KEY</string>
</resources>
```

---

### How to build and distribute[⬆](#overview)

If you wanna build the project locally - skip the next part of this section and go to the [React Native docs](https://reactnative.dev/docs/getting-started) instead.

The [appcenter](https://appcenter.ms/apps) handles build and distribute tasks for the project.

The flow:

1. The appcenter receives all changes almost immediately and you can build there manually or configure the build to run automatically.
2. When the build task is finished the target distribution group will receive an email with a link for downloading the app on device.

---

### How to use CodePush[⬆](#overview)

The [CodePush](https://github.com/microsoft/react-native-code-push) is a tool for pushing code changes (JavaScript) into your environment.

The flow:

1. Before pushing your code _MAKE SURE_ that you don't have wrong environment cached. `react-native start --reset-cache` helps with that. Btw, this command has been already included in all codepush-related scripts in `package.json`.
2. You need `public.pem` and `private.pem` keys to be present in the root project folder
3. To push your code into development or staging environment use these scripts:

- `yarn push-android-stage`
- `yarn push-ios-stage`

4. To push your code into production environment use these scripts:

- `yarn push-android-prod`
- `yarn push-ios-stage`

5. To clean entire codepush bundles directory use:

- `yarn push-android-stage-clean`
- `yarn push-ios-stage-clean`
- `yarn push-android-prod-clean`
- `yarn push-ios-prod-clean`

---

### Tech stack[⬆](#overview)

- The app is generated with [react-native-cli](https://github.com/react-native-community/cli)
- [React Native v0.64.2](https://facebook.github.io/react-native/docs/getting-started)
- [TypeScript v4.0.5](https://www.typescriptlang.org/docs/home.html)
- [React Navigation v5](https://reactnavigation.org/docs/en/getting-started.html)
- [Redux v4.0.5](https://redux.js.org/) and [Redux-Saga](https://redux-saga.js.org/)
- [Styled components v4.4.1](https://www.styled-components.com/docs)

---

### Git workflow[⬆](#overview)

**Intro**

Use [Gitflow](https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow) workflow to avoid inconsistencies in branches/commits

The master branch stores the official release history, and the develop branch serves as an integration branch for features.

Branch prefixes:

- `feature/`
- `bugfix/`
- `hotfix/`
- `release/`

Each branch should have its own Jira task code and the short title in cebab-case format (e.g feature/KOR-10-some-new-feature)

Each commit should have its own related Jira task code in the beginning of the commit message, then a `::` separator to increase a readability to 9000 level (it's not required) and an actual message (e.g. 'KOR-10 :: finish some work on some feature')

After each `git commit` command the [husky](https://www.npmjs.com/package/husky) pre-commit hook is running. You can find a pre-commit hook configuration in `package.json` file.

**Branches overview**

The main branches are `develop`, `staging`, and `production/*`

`develop` branch is created for developers to be able to communicate with dev environment, to develop and test some features and create builds in full isolation from QA team. On the other hand, the QA team uses `staging` branch-based builds to test features and bugfixes. `staging` branch communicates with stage environment. `production/alpha` branch-based builds are distributed through Play Market and App Store.

**Working on the new feature / bugfix**

1. Create a new branch based on `develop`
2. Push your branch to remote repository
3. Make a merge request into `develop` branch
   3.1 (Optional) make a build to test your changes
4. Remove your branch from remote repo
5. If your changes are fine you can merge `develop` branch in `staging`
   5.1 Make a build for QA team based on the `staging` branch

**Working on release**

When the bunch of features/bugfixes are finished and tested you may want to release them all to production

1. Create a new release branch based on `staging` with version number, e.g. `release/v0.0.1`.
2. Increase version number using one of scripts.

- `yarn version-patch`
- `yarn version-minor`
- `yarn version-major`

3. Make a commit with a message including your new version number (e.g. `git commit -m "v0.0.1").
4. Push your new `release/v*` branch to remote repository.
5. When the release branch is ready you can merge it into the `production/alpha` branch and remove your `release/v*` branch after that.
6. While you don't use any alpha-channels (TestFlight, Internal testing, etc...) you may need to include your changes from `production/alpha` to `production/stable` branch. You can merge alpha into stable in remote repo and pull `production/stable` branch and make new tag on it:

```sh
git tag -a v0.0.1 -m "v0.0.1"
```

8. Push tags to origin

```sh
git push origin v0.0.1
```

9. Don't forget to add some notes about this tag. E.g. "Fixed", "Added", "Deprecated", etc.
10. Rebase your working branches to include the newest version commits:

```sh
git checkout develop
git rebase production/stable
```

11. Repeat checkout/rebase steps for other branches if you need it

**Working on hotfix**

When the bug was found on production you should do the following

1. Create a `hotfix/KOR-<TASK_NUMBER>-your-branch-name` branch based on `production/stable`.
2. Work on it and when you finish and test you can merge it in `production/alpha` branch.
3. After that, rebase your `develop` branch by `production/alpha` to apply the hotfix.
4. Also, rebase your `staging` branch by `develop` after that. Now all your protected branches include the hotfix.
5. Push `develop` and `staging` branches to remote repo with `-f` flag to rewrite existing commit history.

---

### Style guide[⬆](#overview)

The code style is mostly covered by some developer tools like [Eslint](https://eslint.org/), [Prettier](https://prettier.io/), and [Husky](https://github.com/typicode/husky). The greatest part of problematic code will be fixed in pre-commit hook by linter and prettier. So, don't stop husky to do its job by using --no-verify flag :stuck_out_tongue: .

- Avoid relative imports if it's possible:

Instead of this

```jsx
import { Button } from '../../../../components/button';
```

Use this

```jsx
import { Button } from 'components';
```

Or even better (if it's not a recycling import)

```jsx
import { Button } from '_atoms';
```

- Avoid of using `StyleSheet.create` and use `styled-components` if you can. No problem with StyleSheet, though, if you need it.
- If you create a platform-specific file, e.g. `index.ios.tsx` and `index.android.tsx`, create an additional `types.ts` file in that directory and place all types-related stuff there.
- If your code solves some problem using not a very clear way, pls, make a comment for other developers and don't make new enemies for yourself.

- You can see a few different approaches with structuring (I was experimenting with different file structures because the code base is really huge). The most convenient approach for me was this. Let's use an example with input component:

```bash
├── ...
├── input # component folder
│   ├── index.ts # the file for exporting all public stuff
│   ├── input.component.tsx # an actual component code
│   ├── input.styles.ts # styled-components stuff...
│   ├── input.spec.tsx # unit tests related to input component
│   ├── input.utils.ts # private utils related only to input component
│   └── input.utils.spec.ts # test coverage for input utils
└── ...
```

---