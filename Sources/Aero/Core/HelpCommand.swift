import DiscordBM
import DiscordModels

enum HelpCommand {

static func send(
    bot: BotGatewayManager,
    message: Gateway.MessageCreate,
    prefix: String
) async {

    let embed = Embed(
        title: "<:swift:1517129392302719056> Aero Command Center",
        description: "Available commands:",
        color: 0xFF6E00,
        fields: CommandRegistry.commands.map {
            Embed.Field(
                name: "`\(prefix)\($0.name)`",
                value: $0.description,
                inline: true
            )
        }
    )

    try? await bot.client.createMessage(
        channelId: message.channel_id,
        payload: .init(
            embeds: [embed]
        )
    )
}

}
