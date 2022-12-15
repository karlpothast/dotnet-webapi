using AutoMapper;
using Application.Features.Counties;
using Application.Features.Counties.GetAdjacentCounties;
using Application.Features.Counties.GetAllCounties;
using Domain.Auth;
using Domain.Entities;

namespace Application.MappingProfiles;

public class MappingProfile : Profile
{
    public MappingProfile()
    {
        // County Map
        CreateMap<County, GetCountyResponse>().ReverseMap();
    }

    
}