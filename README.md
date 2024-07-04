# Contextualized HTML

The context can be used to facilitate the propagation of globally shared state to child nodes. This is ideal for pieces of state that seldom
change but are frequently used throughout the codebase such as the language, theme, or timezone.

A message can be triggered to emit an event that updates a piece of state.
