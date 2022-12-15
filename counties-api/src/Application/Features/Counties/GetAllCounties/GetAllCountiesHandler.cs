using AutoMapper;
using Application.Common;
using Application.Common.Responses;
using Application.Extensions;
using MediatR;
using Microsoft.EntityFrameworkCore;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;

namespace Application.Features.Counties.GetAllCounties;

public class GetAllCountiesHandler : IRequestHandler<GetAllCountiesRequest, PaginatedList<GetCountyResponse>>
{
    private readonly IContext _context;
    private readonly IMapper _mapper;
    
    public GetAllCountiesHandler(IMapper mapper, IContext context)
    {
        _mapper = mapper;
        _context = context;
    }
    public async Task<PaginatedList<GetCountyResponse>> Handle(GetAllCountiesRequest request, CancellationToken cancellationToken)
    {
        var counties = _context.counties
            .WhereIf(!string.IsNullOrEmpty(request.countyName), x => EF.Functions.Like(x.countyName, $"%{request.countyName}%"));
            
        return await _mapper.ProjectTo<GetCountyResponse>(counties)
            .OrderBy(x => x.countyName)
            .ToPaginatedListAsync(request.CurrentPage, request.PageSize);
    }
}