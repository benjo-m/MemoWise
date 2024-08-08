using Core.Data;
using Core.DTOs;
using Core.Models;
using Core.Services;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Core.Controllers;

[Route("api/[controller]")]
[ApiController]
public class DeckController : ControllerBase
{
    private DeckService _deckService;
    public DeckController(DeckService deckService)
    {
        _deckService = deckService;
    }

    [HttpGet]
    public List<DeckDTO> GetDecks()
    {
        return _deckService.GetDecks();
    }
}
