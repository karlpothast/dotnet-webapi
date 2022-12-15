using AutoMapper;
using Application.Common;
using Application.Common.Responses;
using Application.Extensions;
using MediatR;
using Microsoft.EntityFrameworkCore;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using System;

#nullable disable

namespace Application.Features.Counties.GetAdjacentCounties;

public class AdjacentCountiesRequestBody
{
    public Int32 CountyId1 { get; set; }
    public Int32 CountyId2 { get; set; }
}

public class ProcedureResultSet
{
    public string StoredProcReturn { get; set; }
}



