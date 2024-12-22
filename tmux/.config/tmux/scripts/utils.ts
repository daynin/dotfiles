import { $ } from 'bun'

type Task = {
  description: string;
  urgency: number;
}

export const getTasks = async (): Promise<Task[]> => {
  const tasks: Task[] = await $`task export list`.json()

  return tasks.sort((task2, task1) => task1.urgency - task2.urgency)
}
