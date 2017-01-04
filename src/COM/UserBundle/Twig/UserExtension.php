<?php

namespace COM\UserBundle\Twig;

use COM\UserBundle\Service\UserService;
use COM\UserBundle\Entity\User;

class UserExtension extends \Twig_Extension {

    protected $userService;

    public function __construct(UserService $userService) {
        $this->userService = $userService;
    }

    public function getFunctions() {
        return array(
            'getUserById' => new \Twig_Function_Method($this, 'getUserByIdFunction'),
            'userAvatar' => new \Twig_Function_Method($this, 'userAvatarFunction'),
        );
    }

    public function getUserByIdFunction($id) {
        return $this->userService->getUserById($id);
    }

    public function userAvatarFunction(User $user) {
        return $this->userService->getAvatar($user);
    }

    public function getName() {
            return 'user_extension';
    }

}