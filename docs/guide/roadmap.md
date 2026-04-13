# Simulation Roadmap

This page tracks the next expansion targets for `ONI-CADIA`. Everything here is a planning target and is not implemented yet.

## 1. Accelerated Time Layer

Goal:
Move the simulation away from wall-clock-only behavior and give the country its own compressed calendar.

Current design target:

- `1 real hour = 1 in-simulation day`
- the ratio should stay configurable so we can slow down or speed up the country later
- every important event should keep both wall-clock time and simulation time

What this should unlock:

- daily citizen routines even when the real run is short
- faster policy cycles, economic turns, and social events
- clearer summaries such as "what happened today" inside the simulated nation

## 2. Rival States With A Three Kingdoms Structure

Goal:
Turn `ONI-CADIA` from a single-state civic sandbox into a world with multiple powers.

Initial structure:

- one focal nation: `ONI-CADIA`
- two additional major rival states to create a three-power balance
- each state should have its own ideology, leadership logic, strengths, weaknesses, and tone

What to simulate between states:

- diplomacy and treaties
- trade and resource pressure
- propaganda and information warfare
- border incidents, proxy tension, and limited military escalation

## 3. What The Simulation Needs To Feel More Like A Nation

The current country concept can grow by adding the following layers:

| Layer | Why it matters |
| --- | --- |
| Government and institutions | Gives the country ministries, chains of command, and operating bodies instead of only individual citizens. |
| Law and policy | Makes state action legible through rules, decrees, taxes, budgets, and reforms. |
| Territory and infrastructure | Gives nations borders, strategic locations, logistics, and places worth defending. |
| Economy and resources | Creates pressure around food, energy, labor, trade routes, and production capacity. |
| Public sentiment and legitimacy | Lets the population support, fear, resist, or distrust the state. |
| History and archives | Builds continuity so wars, reforms, disasters, and achievements matter later. |
| Security and military posture | Makes rival states meaningful through deterrence, defense, intelligence, and force projection. |

## 4. Population Expansion

Goal:
Make the country feel inhabited instead of being only a founding triad.

Population directions:

- increase the number of citizens beyond the initial three-agent team
- distinguish social layers such as rulers, administrators, workers, creators, traders, soldiers, and outsiders
- make population change over time through recruitment, migration, promotion, loss, and replacement

Operational concern:

- more citizens means more pods, more persona scaffolds, more state to track, and more coordination surfaces
- scaling population should be paired with stronger orchestration, archives, and summarization flows

## Suggested Order

1. Add the simulation clock and dual-timestamp model.
2. Define the three-state schema and faction profiles.
3. Introduce nation systems such as institutions, resources, laws, and state metrics.
4. Scale citizen count and add population-change mechanics.

