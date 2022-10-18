nums = [1, 2, 3, 4]
List = [1, 2, 3, 4]

class Solution:
    def runningSum(self, nums: List[int]) -> List[int]:
        for i in range(1, len(nums)):
            nums[i] = nums[i-1]+nums[i]
        return nums

Solution(List)