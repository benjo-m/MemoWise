using System.Text.Json.Serialization;

namespace Core.Models;

public class Card
{
    public int Id { get; set; }
    public string FrontText { get; set; }
    public string BackText { get; set; }
    public int StatusId { get; set; }
    public CardStatus Status { get; set; }
    public int DeckId { get; set; }
    [JsonIgnore]
    public Deck Deck { get; set; }
}
