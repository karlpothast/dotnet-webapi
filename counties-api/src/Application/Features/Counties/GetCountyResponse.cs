using Domain.Entities.Common;

namespace Application.Features.Counties;

public record GetCountyResponse
{
    public CountyId Id { get; init; }
    public string? countyName { get; init; }
}