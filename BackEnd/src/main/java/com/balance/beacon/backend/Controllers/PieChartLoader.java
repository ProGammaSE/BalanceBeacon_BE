package com.balance.beacon.backend.Controllers;

import org.springframework.context.annotation.Conditional;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PieChartLoader {

    @GetMapping("/")
    public String viewHtmlPage() {
        return "index.html";
    }
}
