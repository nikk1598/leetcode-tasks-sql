class Solution:
    def is_integer(self, s):
        try:
            int(s)
            return True
        except ValueError:
            return False

    def calPoints(self, operations: List[str]) -> int:
        record = []
        for x in operations:
            if self.is_integer(x):
                record.append(int(x))
            elif x == '+':
                record.append(int(record[-1]) + int(record[-2]))
            elif x == 'D':
                record.append(int(record[-1] * 2))
            elif x == 'C':
                record.pop()
        return sum(record)