# Chats

Chat with Meta’s Llama 2 on your MacBook without installing any other software or connecting to the internet. Every conversation is saved locally.

## Dev

Not sure what this is like to run on another machine. Try it out.

1. Download [llama-2-7b-chat.ggmlv3.q4_1.bin](https://huggingface.co/TheBloke/Llama-2-7B-Chat-GGML/tree/main) to Mantras/NPC
2. Open Mantras.xcodeproj
3. Run and fix errors?

### Roadmap / TODO (roughly in order):
- [ ] Chat with Llama 2 7B without installing anything else
  - [x] hook agent up, save convos to coredata
  - [ ] server should shut down more reliably, try storing pids and reaping orphans
  - [ ] user can edit convo titles
  - [ ] TextField and NavigationLink focus behavior work more like Messages
  - [ ] make intel chips work by [making a universal `server` binary](https://developer.apple.com/documentation/apple-silicon/building-a-universal-macos-binary#Update-the-Architecture-List-of-Custom-Makefiles)

- [ ] Try any llama.cpp compatible model
- [ ] Change system prompts to modify personas or expertise
- [ ] Search conversations