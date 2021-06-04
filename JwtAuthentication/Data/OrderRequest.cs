﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace JwtAuthentication.Data
{
    public class OrderRequest
    {
        public Guid UserId { get; set; }
        public OrderDetailsRequest[] OrderDetails { get; set; }
    }
}
