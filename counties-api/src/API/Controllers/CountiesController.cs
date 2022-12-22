using Application.Common.Responses;
using System.Threading.Tasks;
using Application.Features.Counties.GetAdjacentCounties;
using Application.Features.Counties.GetAllCounties;
using Domain.Entities.Common;
using MediatR;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Cors;
using Api.SQL;
using System.IO;
using System.Text;
using System;
using Application.Features.Counties;
using System.Collections.Generic;

namespace Api.Controllers;

[ApiController]
[AllowAnonymous]
[Route("api/[controller]")]
[EnableCors]
public class CountyController : ControllerBase
{
    private readonly IMediator _mediator;

    public CountyController(IMediator mediator)
    {
        _mediator = mediator;
    }

    [HttpGet]
    [Route("GetAllCounties")]
    [EnableCors]
    public async Task<ActionResult<PaginatedList<GetCountyResponse>>> GetAllCounties([FromQuery] GetAllCountiesRequest request)
    {
        return Ok(await _mediator.Send(request));
    }

    [HttpPost]
    [Route("GetAdjacentCounties")]
    [EnableCors]
    public ActionResult<string> GetAdjacentCountiesResult(AdjacentCountiesRequestBody input)
    {
      SqlCmdWrapper sqlcmd1 = new SqlCmdWrapper();
      var result = sqlcmd1.ExecSQLQuery(input.CountyId1, input.CountyId2);
      return result;
    }

}