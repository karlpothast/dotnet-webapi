using Domain.Entities.Common;
using MassTransit;

namespace Domain.Entities;

public class County : Entity<CountyId>
{
    public override CountyId Id { get; set; } = NewId.NextSequentialGuid();
    public string countyName { get; init; } = null!;
}