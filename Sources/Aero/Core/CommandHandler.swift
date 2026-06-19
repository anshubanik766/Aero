import Foundation
import DiscordBM
import DiscordModels

enum CommandHandler {

static func handle(
    bot: BotGatewayManager,
    message: Gateway.MessageCreate,
    prefix: String
) async {

    guard message.author?.bot != true else {
        return
    }

    guard message.content.hasPrefix(prefix) else {
        return
    }

    let content = String(
        message.content.dropFirst(prefix.count)
    )

    let parts = content
        .split(separator: " ")
        .map(String.init)

    guard let commandName = parts.first?.lowercased() else {
        return
    }

    let arguments = Array(parts.dropFirst())

    let commands = Dictionary(
        uniqueKeysWithValues:
            CommandRegistry.commands.map {
                ($0.name.lowercased(), $0)
            }
    )

    if commandName == "help" {
        await HelpCommand.send(
            bot: bot,
            message: message,
            prefix: prefix
        )
        return
    }

    guard let command = commands[commandName] else {
        return
    }

    do {

        try await command.execute(
            bot: bot,
            message: message,
            arguments: arguments
        )

    } catch {

        print("❌ \(commandName): \(error)")
    }
}

}
