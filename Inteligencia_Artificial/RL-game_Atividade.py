import numpy as np
import gymnasium as gym
from gymnasium import spaces
import matplotlib.pyplot as plt
from collections import defaultdict
import random
import pickle


class MazeEnv(gym.Env):
    def __init__(self):
        super(MazeEnv, self).__init__()

        # Define grid size
        self.height = 20
        self.width = 20

        # Define elements
        self.EMPTY = 0
        self.WALL = 1
        self.HOLE = 2
        self.AGENT = 3
        self.GOAL = 4
        self.ENEMY = 5
        self.AGENT_POSITION = [1, 1]
        self.ENEMY_POSITION = [14, 14]

        # Initialize visualization
        self.fig, self.ax = plt.subplots(figsize=(7, 5))
        plt.ion()

        # Action space: up, right, down, left
        self.action_space = spaces.Discrete(4)
        # Observation space: single number representing state
        self.observation_space = spaces.Discrete(self.height * self.width)

        # Set agent, enemy and goal position
        self.agent_pos = self.AGENT_POSITION.copy()
        self.enemy_pos = self.ENEMY_POSITION.copy()
        self.goal_pos = [15, 15]
        self.turn = 0

        # Create grid
        self.grid = np.zeros((self.height, self.width))
        self.grid_initialization()

    def grid_initialization(self):
        self.grid = np.zeros((self.height, self.width))
        # Add border walls
        self.grid[0:self.height, 0] = self.WALL
        self.grid[0, 0:self.width ] = self.WALL
        self.grid[self.height-1, 0:self.width] = self.WALL
        self.grid[0:self.height , self.width-1] = self.WALL
        # Add inner walls
        self.grid[2:9, 2] = self.WALL
        self.grid[2:9, 4] = self.WALL
        self.grid[2:9, 8] = self.WALL
        self.grid[2:6, 10:15] = self.WALL
        self.grid[1:6, 16:19] = self.WALL
        self.grid[2, 6:8] = self.WALL
        self.grid[4, 5:7] = self.WALL
        self.grid[6, 6:8] = self.WALL
        self.grid[8, 5:7] = self.WALL
        self.grid[7:9, 10:12] = self.WALL
        self.grid[7:9, 13:15] = self.WALL
        self.grid[7:14, 16:18] = self.WALL
        self.grid[14:16, 17] = self.WALL
        self.grid[10, 1:3] = self.WALL
        self.grid[10, 4:7] = self.WALL
        self.grid[10, 8:11] = self.WALL
        self.grid[10, 12:14] = self.WALL
        self.grid[11, 9:14:4] = self.WALL
        self.grid[12, 2:7:2] = self.WALL
        self.grid[12, 7] = self.WALL
        self.grid[14, 1:8:2] = self.WALL
        self.grid[17, 3:12:4] = self.WALL
        self.grid[18, 5:14:4] = self.WALL
        self.grid[15, 7] = self.WALL
        self.grid[16, 3:13] = self.WALL
        self.grid[13, 13:15] = self.WALL
        self.grid[14, 13] = self.WALL
        self.grid[15, 12:15] = self.WALL
        self.grid[16, 14:16] = self.WALL
        self.grid[17, 15:18] = self.WALL
        # Add holes
        self.grid[15, 1] = self.HOLE
        self.grid[17, 2] = self.HOLE
        self.grid[6, 12] = self.HOLE
        self.grid[14, 9] = self.HOLE
        self.grid[13, 10] = self.HOLE
        self.grid[12, 11] = self.HOLE
        self.grid[16, 13] = self.HOLE
        # Set initial positions
        self.grid[self.agent_pos[0], self.agent_pos[1]] = self.AGENT
        self.grid[self.goal_pos[0], self.goal_pos[1]] = self.GOAL
        self.grid[self.enemy_pos[0], self.enemy_pos[1]] = self.ENEMY

    def get_state(self):
        return self.agent_pos[0] * self.width + self.agent_pos[1]

    def step(self, action):
        # Save previous position
        prev_pos = self.enemy_pos.copy()

        # Move enemy
        if self.turn % 8 < 2:  # right
            self.enemy_pos[1] = min(self.width - 1, self.enemy_pos[1] + 1)
        elif self.turn % 8 < 4:  # down
            self.enemy_pos[0] = min(self.height - 1, self.enemy_pos[0] + 1)
        elif self.turn % 8 < 6:  # up
            self.enemy_pos[0] = max(0, self.enemy_pos[0] - 1)
        elif self.turn % 8 < 8:  # left
            self.enemy_pos[1] = max(0, self.enemy_pos[1] - 1)

        # Update grid
        self.grid[prev_pos[0], prev_pos[1]] = self.EMPTY
        self.grid[self.enemy_pos[0], self.enemy_pos[1]] = self.ENEMY

        # Add 1 turn
        self.turn += 1

        # Save previous position
        prev_pos = self.agent_pos.copy()

        # Enemy caught agent
        if self.grid[self.agent_pos[0], self.agent_pos[1]] == self.ENEMY:
            return self.get_state(), -10, True, False, {}

        # Move agent
        if action == 0:  # up
            self.agent_pos[0] = max(0, self.agent_pos[0] - 1)
        elif action == 1:  # right
            self.agent_pos[1] = min(self.width - 1, self.agent_pos[1] + 1)
        elif action == 2:  # down
            self.agent_pos[0] = min(self.height - 1, self.agent_pos[0] + 1)
        elif action == 3:  # left
            self.agent_pos[1] = max(0, self.agent_pos[1] - 1)

        # Check if new position is valid
        new_pos_value = self.grid[self.agent_pos[0], self.agent_pos[1]]

        # Define rewards and terminal states
        done = False
        reward = -1  # small negative reward for each step

        if new_pos_value == self.WALL:
            self.agent_pos = prev_pos  # revert move
            reward = -5
        elif new_pos_value == self.HOLE or new_pos_value == self.ENEMY:
            done = True
            reward = -10
        elif self.agent_pos == self.goal_pos:
            done = True
            reward = 100
            
        # Update grid
        if new_pos_value != self.WALL:
            self.grid[prev_pos[0], prev_pos[1]] = self.EMPTY
            self.grid[self.agent_pos[0], self.agent_pos[1]] = self.AGENT

        return self.get_state(), reward, done, False, {}

    def reset(self, *, seed = None, options = None, return_info = False,):
        super().reset(seed=seed)
        # Reset game to initial state
        self.turn = 0
        self.agent_pos = self.AGENT_POSITION.copy()
        self.enemy_pos = self.ENEMY_POSITION.copy()
        self.grid_initialization()
        return self.get_state(), {}

    def render(self):
        self.ax.clear()
        # Define colors for each element
        colors = {
            self.EMPTY: 'white',
            self.WALL: 'gray',
            self.HOLE: 'black',
            self.AGENT: 'blue',
            self.GOAL: 'green',
            self.ENEMY: 'red'
        }

        name = {
            self.EMPTY: 'Vazio',
            self.WALL: 'Parede',
            self.HOLE: 'Buraco',
            self.AGENT: 'Agente',
            self.GOAL: 'Objetivo',
            self.ENEMY: 'Inimigo'
        }

        # Create color map
        cmap = plt.cm.colors.ListedColormap(list(colors.values()))
        # Plot the grid
        self.ax.imshow(self.grid, cmap=cmap)

        # Add legend
        legend_elements = [plt.Rectangle((0, 0), 1, 1, facecolor=color, label=name[key])
                           for key, color in colors.items()]
        self.ax.legend(handles=legend_elements, loc='center left', bbox_to_anchor=(1, 0.5))

        plt.axis('off')
        plt.pause(0.05)
        self.fig.canvas.draw()

def q_learn(maze, episodes, alpha, gamma, epsilon):

    def print_q_table(table):
        for i in range(len(table)):
            print(table[i])

    def get_best_move(q_table, state):
        return np.argmax(q_table[state])

    def explore(alpha, gama, learning_counter):
        state = env.get_state()
        action = env.action_space.sample()
        prev_state = state
        prev_action = action
        state, reward, done, _, _ = env.step(action)
        q_table[prev_state, prev_action] = (1 - alpha) * (q_table[prev_state, prev_action]) + alpha * (reward + gama * np.max(q_table[state]))
        learning_counter += reward
        if done:
            if learning_counter > 0:
                return True, done, 
        return False, done, 

    def exploit(alpha, gama, learning_counter):
        state = env.get_state()
        action = get_best_move(q_table, state)
        prev_state = state
        prev_action = action
        state, reward, done, _, _ = env.step(action)
        q_table[prev_state, prev_action] = (1 - alpha) * (q_table[prev_state, prev_action]) + alpha * (reward + gama * np.max(q_table[state]))
        learning_counter += reward
        if done:
            if learning_counter>0:
                return True, done, 
        return False, done, 
    
    q_table = np.zeros((maze.width*maze.height, maze.action_space.n))
    action_counter = 0
    done = False

    for i in range(episodes):
        has_learned = False
        learning_counter = 0

        while (not has_learned):

            if random.uniform(0, 1) < epsilon:
                has_learned, done = explore(alpha, gamma, learning_counter)
                action_counter+=1
            else:
                has_learned, done = exploit(alpha, gamma, learning_counter)
                action_counter+=1

        epsilon = max(0.01, epsilon * 0.99)
        env.reset()

    print(f"Finalizado em {action_counter//episodes} ações!")
    return q_table

env = MazeEnv()
q_table = q_learn(env,
                  episodes=500,
                  alpha=0.8,
                  gamma=0.1,
                  epsilon=0.9)

state, _ = env.reset()
#env.render()

done = False
while not done:
    action = np.argmax(q_table[state])
    # print(env.get_state(), q_table[env.get_state()])
    state, reward, done, _, _ = env.step(action)
    #env.render()
