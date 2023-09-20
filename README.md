<p align="center" width="100%">
<img width="120" alt="FreeChat app icon" src="https://github.com/psugihara/FreeChat/assets/282016/b5abfa45-9200-4821-8c78-53892be22794">
</p>


<h1 align="center">FreeChat</h1>

Chat with Meta’s Llama 2 on your MacBook without installing any other software. Every conversation is saved locally, all conversations happen offline.

- Customize persona and expertise by changing the system prompt
- Try any llama.cpp compatible model
- No internet connection required, all local
- Conversations sync natively via iCloud

https://github.com/non-playable/FreeChat/assets/282016/c87c868f-d2ea-4546-b738-d12f9ec95a08

## Design goals

I want FreeChat to be a native LLM appliance for macOS that runs completely locally. Download it and ask your LLM a question without doing any configuration. Like OpenAI's chat without login or tracking. You should be able to install from the Mac App Store and use it immediatly.

- No config. Usable by people who haven't heard of models, prompts, or LLMs.
- Performance and simplicity over dev experience or features. Notes not Word, Swift not Elektron.
- Local first. Core functionality should not require an internet connection. There are lots of great clients for GPT-4, claude, etc. This is not one of them.
- No conversation tracking. Talk about whatever you want with FreeChat, just like Notes.

## Install

Download the TestFlight here: https://6032904148827.gumroad.com/l/freechat-beta

Or build from source via "Archive" in Xcode after completing dev setup below.

## Dev Setup

Not sure what this is like to run on another machine. Try it out.

1. Download [spicyboros-7b-2.2.Q3_K_S.gguf](https://huggingface.co/TheBloke/Spicyboros-7B-2.2-GGUF/resolve/main/spicyboros-7b-2.2.Q3_K_S.gguf) to FreeChat/Models/NPC
2. Open FreeChat.xcodeproj
3. Run and fix errors?

### Roadmap / TODO (roughly in order):
- [ ] Chat with Llama 2 7B without installing anything else
  - [x] hook agent up, save convos to coredata
  - [x] server shuts down reliably even on force quit
  - [x] user can edit convo titles
  - [x] make intel chips work by [making a universal `server` binary](https://developer.apple.com/documentation/apple-silicon/building-a-universal-macos-binary#Update-the-Architecture-List-of-Custom-Makefiles)
  - [x] App icon
  - [x] New name
  - [x] Conversation null state
  - [x] user can copy conversation
  - [x] new conversation should focus textarea
  - [x] interrupt llama
  - [x] llama should pause for a moment before responding if text hasn't generated
  - [x] convo scroll behavior breaks on code blocks, syntax highligting would be nice

- [x] Try any llama.cpp compatible model
  - [x] configure model in Settings
  - [x] explain how to download models
  - [ ] show errors when bad model files are used
- [x] Change system prompts to modify personas or expertise
- [ ] Search conversations
- [ ] Personas - save system prompt / model settings for later and change personas when you create a new conversation

### Credits

This project would not be possible without the hard work of:

- Georgi Gerganov for [llama.cpp](https://github.com/ggerganov/llama.cpp)
- Meta for training Llama 2
- Jon Durbin for training Spicyboros, the default model
- TheBloke (Tom Jobbins) for model quantization
- Monica Kogler for the FreeChat logo and uncountable UX consults

Also many thanks to Billy Rennekamp, Elliot Hursh, Judd Schoenholtz, Alex Farrill for invaluable spitballing sessions.
