resource "azurerm_monitor_diagnostic_setting" "servicebus" {
  name                       = "sb-to-loganalytics"
  target_resource_id         = azurerm_servicebus_namespace.sb.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.sb_logs.id

  enabled_log {
    category = "OperationalLogs"
  }

  enabled_log {
    category = "RuntimeAuditLogs"
  }

  enabled_log {
    category = "DeadLetterQueueLogs"
  }

  metric {
    category = "AllMetrics"
  }
}
