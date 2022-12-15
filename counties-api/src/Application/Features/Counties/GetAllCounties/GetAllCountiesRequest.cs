using Application.Common.Requests;
using Application.Common.Responses;
using MediatR;

namespace Application.Features.Counties.GetAllCounties;

public record GetAllCountiesRequest : PaginatedRequest, IRequest<PaginatedList<GetCountyResponse>>
{
    public string? countyName { get; init; }
}