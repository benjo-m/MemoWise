using Core.Models;

namespace Core.DTOs;

public class CardDTO
{
    public int Id { get; set; }
    public string FrontText { get; set; }
    public string BackText { get; set; }
    public string Status { get; set; }

    public CardDTO(Card card)
    {
        Id = card.Id;
        FrontText = card.FrontText;
        BackText = card.BackText;
        Status = card.Status.Status;
    }
}
