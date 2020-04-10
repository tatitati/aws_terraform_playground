resource "aws_ecs_task_definition" "service" {
  family                = "service"
  container_definitions = "${file("modules/ecs_task_definition_multicontainer/containers.json")}"
  memory                = 300
  cpu                   = 250
}
