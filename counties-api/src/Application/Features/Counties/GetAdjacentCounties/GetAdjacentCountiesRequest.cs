using Application.Common.Requests;
using Application.Common.Responses;
using MediatR;

namespace Application.Features.Counties.GetAdjacentCounties;

public record GetAdjacentCountiesRequest : IRequest<GetCountyResponse?>
{
    public int? CountyId1 { get; init; }
    public int? CountyId2 { get; init; }
}

