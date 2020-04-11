resource "aws_ecs_task_definition" "service" {
  family                = "centos"
  container_definitions = "${file("modules/ecs_task_definition_1container/container_centos.json")}"
  memory                = 300
  cpu                   = 250
}
