![version](https://img.shields.io/badge/version-20%2B-E23089)
![platform](https://img.shields.io/static/v1?label=platform&message=mac-intel%20|%20mac-arm%20|%20win-64&color=blue)

# HDI_Passwords

Driving 4D's built-in user/password (access) system from code: listing users, switching the current user, backing up and restoring the password list, and replacing the standard login prompt with a custom form. Originally published by 4D as a **HDI** (*How Do I*) example for **4D v11**; restored so it runs on current 4D releases.

## What it demonstrates

- Enumerating the accounts defined in the 4D password system with `GET USER LIST`, then filtering out deleted accounts via `Is user deleted`.
- Reading per-user metadata (name, startup method, use count, last-use date) with `GET USER PROPERTIES`.
- Authenticating programmatically with `CHANGE CURRENT USER`, both silently and against typed credentials.
- Gating features by group membership with `User in group` and reporting the active account with `Current user`.
- Backing up and restoring the entire user list to a BLOB field with `USERS TO BLOB` / `BLOB TO USERS`.
- Offering a choice between the native 4D login dialog and a fully custom login form (`D_Login`), with a password-masked entry field set via `OBJECT SET FONT("%Password")`.
- Attaching a per-user icon: default icon plus a mask blended with picture operators (`CREATE THUMBNAIL`, `PICTURE PROPERTIES`, the `&` blend operator).

## Key commands

| Command | Used for |
|---|---|
| `GET USER LIST` | Retrieve all user names and IDs defined in the structure |
| `Is user deleted` | Skip accounts marked as deleted when building the login list |
| `CHANGE CURRENT USER` | Log in (silently or with supplied name/password) |
| `GET USER PROPERTIES` | Load an account's name, startup method, use count and last-use date |
| `Current user` | Show which account is currently active |
| `User in group` | Enable the Users tab only for members of the `Staff` group |
| `USERS TO BLOB` | Serialise the whole password list into a BLOB for backup |
| `BLOB TO USERS` | Restore the password list from that BLOB |

## How it works

On startup, `On_Open` optionally shows the built-in identification dialog (`CHANGE CURRENT USER` when Shift is held), runs the compiler declaration methods, then opens the preferences process via `PS_Preferences`. That method creates a single `[PREFERENCES]` record holding `LoginDialogType`, sets up the input/output forms, and opens the preferences form where the user picks *4D Dialog* or *Custom dialog*.

`PS_Login` implements the two login paths. With `LoginKind=0` it calls the native `CHANGE CURRENT USER`; with `LoginKind=1` it opens the custom `D_Login` form. The `D_Login` form method builds the account picker: it calls `GET USER LIST`, drops deleted users with `Is user deleted`, keeps only those whose `[UserInformation]VisibleInDialog` flag is set, attaches each stored `UserIcon`, and sorts the list. `Button2` (Login) wraps `CHANGE CURRENT USER(<>UserName; <>UserPassword)` in `ON ERR CALL("UsersError")`; on failure `UsersError` shakes the window with `SET WINDOW RECT`, on success it `ACCEPT`s.

Backup and restore live in the `[PREFERENCES]` input form (`TableForms/1/Input`). `bBackup` calls `USERS TO BLOB` into `[PREFERENCES]UserInformation` and saves the record; `bRestore` calls `BLOB TO USERS` from it. Both buttons are enabled only for the `administrator` account, decided in the form method with `Current user` and `User in group`.

The most interesting file is `UserBuildIcon`, which normalises an arbitrary user picture into a framed 64x64 icon: it thumbnails oversized images with `CREATE THUMBNAIL`, centres them using the picture `+` (horizontal) and `/` (vertical) shift operators, and blends a rounded mask with the picture `&` operator.

## Points of interest

- The password field is masked purely by font: `OBJECT SET FONT(<>UserPassword; "%Password")` renders bullets instead of characters -- no special widget required.
- `USERS TO BLOB` / `BLOB TO USERS` copy the entire directory of accounts, so restoring overwrites all current users; the demo guards these behind the `administrator` login.
- The `CustomPWDlg_OM` code still calls the deprecated resource commands `_O_SET PICTURE RESOURCE`, `_O_DELETE RESOURCE` and `GET PICTURE RESOURCE` to store a custom logo in `PICT` resources -- a v11-era mechanism retained here for fidelity.
- Group-based UI: the Users tab and backup buttons appear only for members of `Staff` / the `administrator` account, illustrating access control driven from `User in group` and `Current user`.

## References

- [4D documentation: GET USER LIST](https://developer.4d.com/docs/commands/get-user-list)
- [4D documentation: CHANGE CURRENT USER](https://developer.4d.com/docs/commands/change-current-user)
- [4D documentation: GET USER PROPERTIES](https://developer.4d.com/docs/commands/get-user-properties)
- [4D documentation: USERS TO BLOB](https://developer.4d.com/docs/commands/users-to-blob)
- [4D documentation: BLOB TO USERS](https://developer.4d.com/docs/commands/blob-to-users)
- Index of v16/v17 HDIs: [miyako/4d-hdi](https://github.com/miyako/4d-hdi)

## Screenshots

<img width="500" height="auto" alt="" src="https://github.com/user-attachments/assets/609792d5-c2c5-4921-934b-339ab2c3fdf8" />

<img width="500" height="auto" alt="" src="https://github.com/user-attachments/assets/c6939b13-4043-40a5-90d8-8451d07358c4" /><br /><img width="250" height="auto" alt="" src="https://github.com/user-attachments/assets/eea459b2-4f82-4780-946b-9f8e5e64f28c" />
