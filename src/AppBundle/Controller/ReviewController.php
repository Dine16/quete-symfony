<?php

namespace AppBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\ParamConverter;

use AppBundle\Entity\User;
use AppBundle\Entity\Flight;

/**
 * Review controller.
 *
 * @Route("review")
 */

class ReviewController extends Controller
{
    /**
     * List one review with one user on one flight, with few IDs.
     *
     * @Route("/{user_id}/flight/{flight_id}", name="review_index", requirements={"user_id": "\d+"})
     * @Method("GET")
     * @ParamConverter("user", options={"mapping": {"user_id": "id"}})
     * @ParamConverter("flight", options={"mapping": {"flight_id": "id"}})
     */

    public function indexAction(User $user, Flight $flight)
    {
        return $this->render('review/index.html.twig', array(
            'user' => $user,
            'flight' => $flight
        ));
    }

    /**
     * @Route("/new/", name="review_new")
     * @Method({"GET", "POST"})
     */

    public function newAction()
    {
        return $this->render('review/new.html.twig');
    }
}



