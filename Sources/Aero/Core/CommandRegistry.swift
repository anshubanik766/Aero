import Foundation

enum CommandRegistry {

static let commands: [BotCommand] = [
    ClearCommand(),
    KickCommand(),
    UserInfoCommand(),
    ServerInfoCommand(),
    ChooseCommand()
]

}
