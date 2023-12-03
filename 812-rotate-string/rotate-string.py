
from collections import deque

class Solution:
    def rotateString(self, s: str, goal: str) -> bool:
        dq = deque(goal)
        if len(s) != len(goal):
            return False

        for _ in range(len(goal)):
            dq.appendleft(dq.pop())
            coincidences_count = 0
            for i in range(len(dq)):
                if dq[i]== s[i]:
                    coincidences_count += 1
            if coincidences_count == len(dq):
                return True
        
        return False
        

        