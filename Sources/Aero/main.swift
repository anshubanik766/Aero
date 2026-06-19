import Foundation
import DiscordBM
import DiscordModels

@main
struct AeroBot {

    static func main() async throws {

        let prefix = "?"

        guard let token = ProcessInfo.processInfo.environment["DISCORD_TOKEN"] else {
            fatalError("❌ DISCORD_TOKEN missing")
        }

        let bot = await BotGatewayManager(
            token: token,
            presence: .init(
                activities: [
                    .init(
                        name: "\(prefix)help",
                        type: .playing
                    )
                ],
                status: .online,
                afk: false
            ),
            intents: [
                .guildMessages,
                .messageContent,
                .guildMembers
            ]
        )

        print("🚀 Aero starting...")

        await bot.connect()

        let events = await bot.events

        for await event in events {

            guard case let .messageCreate(message) = event.data else {
                continue
            }

            await CommandHandler.handle(
                bot: bot,
                message: message,
                prefix: prefix
            )
        }
    }
}
