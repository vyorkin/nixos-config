/* 0302a: enable auto-INSTALLING Firefox updates [NON-WINDOWS FF65+] */
user_pref("app.update.auto", true);

/* 0801: enable location bar using search */
user_pref("keyword.enabled", true);

/* 0903: set how often Firefox should ask for the master password
 * 0=the first time (default), 1=every time it's needed, 2=every n minutes (see 0904) ***/
user_pref("security.ask_for_password", 0);


/* 0905: enable auto-filling username & password form fields
 * can leak in cross-site forms *and* be spoofed
 * [NOTE] Username & password is still available when you enter the field
 * [SETTING] Privacy & Security>Logins and Passwords>Autofill logins and passwords ***/
user_pref("signon.autofillForms", true);

/* 1401: enable websites choosing fonts (0=block, 1=allow) */
user_pref("browser.display.use_document_fonts", 1);

/* 2001: enable WebRTC (Web Real-Time Communication)
 * [SETUP-WEB] WebRTC can leak your IP address from behind your VPN, if this is
 * in your threat model, and you want Real-Time Communication, this is the pref for you
 * [1] https://www.privacytools.io/#webrtc ***/
user_pref("media.peerconnection.enabled", true);

/* 2022: enable screensharing ***/
user_pref("media.getusermedia.screensharing.enabled", true);
user_pref("media.getusermedia.browser.enabled", true);
user_pref("media.getusermedia.audiocapture.enabled", true);


/* 2402: enable website access to clipboard events/content
 * [SETUP-WEB] Disabling this will break some sites functionality such as pasting into facebook, wordpress
 * This applies to onCut/onCopy/onPaste events - i.e. it requires interaction with the website
 * [WARNING] If both 'middlemouse.paste' and 'general.autoScroll' are true (at least one
 * is default false) then enabling this pref can leak clipboard content, see [2]
 * [1] https://www.ghacks.net/2014/01/08/block-websites-reading-modifying-clipboard-contents-firefox/
 * [2] https://bugzilla.mozilla.org/1528289 */
user_pref("dom.event.clipboardevents.enabled", true);

/* 2404: Enable clipboard commands (cut/copy) from "non-privileged" content [FF41+] */
user_pref("dom.allow_cut_copy", true);

/* 2803: set what items to clear on shutdown (if 2802 is true) [SETUP-CHROME]
 * [NOTE] If 'history' is true, downloads will also be cleared regardless of the value
 * but if 'history' is false, downloads can still be cleared independently
 * However, this may not always be the case. The interface combines and syncs these
 * prefs when set from there, and the sanitize code may change at any time
 * [SETTING] Privacy & Security>History>Custom Settings>Clear history when Firefox closes>Settings ***/
user_pref("privacy.clearOnShutdown.cache", false);
user_pref("privacy.clearOnShutdown.cookies", false);
user_pref("privacy.clearOnShutdown.downloads", false); // see note above
user_pref("privacy.clearOnShutdown.formdata", false); // Form & Search History
user_pref("privacy.clearOnShutdown.history", false); // Browsing & Download History
user_pref("privacy.clearOnShutdown.offlineApps", false); // Offline Website Data
user_pref("privacy.clearOnShutdown.sessions", false); // Active Logins
user_pref("privacy.clearOnShutdown.siteSettings", false); // Site Preferences

/* 4504: disable RFP letterboxing [FF67+]
 * see: https://github.com/ghacksuserjs/ghacks-user.js/issues/728
 * Enabling it dynamically resizes the inner window (FF67; 200w x100h: FF68+; stepped ranges) by applying letterboxing,
 * using dimensions which waste the least content area, If you use the dimension pref, then it will only apply
 * those resolutions. The format is "width1xheight1, width2xheight2, ..." (e.g. "800x600, 1000x1000, 1600x900")
 * [SETUP-WEB] This does NOT require RFP (see 4501) **for now**, so if you're not using 4501, or you are but you're
 * not taking anti-fingerprinting seriously and a little visual change upsets you, then feel free to flip this pref
 * [WARNING] The dimension pref is only meant for testing, and we recommend you DO NOT USE it
 * [1] https://bugzilla.mozilla.org/1407366 ***/
user_pref("privacy.resistFingerprinting.letterboxing", false); // [HIDDEN PREF]
